# Sudo

Enable TouchID for `sudo`:

```bash
sudo -s
cd /etc/pam.d
chmod u+w sudo
vi sudo
# auth sufficient pam_tid.so
chmod u-w sudo
```
