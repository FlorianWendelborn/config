module.exports = ({proxy}) => proxy
	.map(({authentication, certificate, map}) => Object
		.keys(map)
		.map(domain => create({
			authentication,
			certificate,
			domain,
			target: map[domain]
		}))
	)
	.reduce((a, b) => a.concat(b))
	.join('\n\n')

const create = ({authentication, certificate, domain, target}) => `server {
	server_name ${domain};

	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate ${certificate.public};
	ssl_certificate_key ${certificate.private};

	location / {
		${createAuthentication(authentication)}

		proxy_http_version 1.1;
		proxy_pass ${target};
		proxy_set_header Host $host;
	}
}`

const createAuthentication = authentication => {
	if (!authentication) return ''

	if (authentication.type === 'basic') {
		if (authentication.allow && authentication.allow.includes('CORS'))
			return `limit_except OPTIONS {
			auth_basic "Protected Area";
			auth_basic_user_file ${authentication.location};
		}`
		else
			return `auth_basic "Protected Area";
		auth_basic_user_file ${authentication.location};`
	} else {
		throw new Error('Unknown Authentication Type')
	}
}
