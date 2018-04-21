> [Default File Viewer](https://binarynights.com/manual#fileviewer)

> You can set ForkLift 3 as default file viewer, and almost every app (except Desktop) will point to ForkLift when you choose Reveal in Finder, Show in Finder, or Open in Finder options. Paste the following command into Terminal and hit Enter:

```sh
defaults write -g NSFileViewer -string com.binarynights.ForkLift-3;
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType="public.folder";LSHandlerRoleAll="com.binarynights.ForkLift-3";}'
```

> Then restart your Mac. The second command is required in order to open folders in ForkLift by pressing Enter in Alfred. 
> To change it back to Finder, use the following command then restart your Mac:

```sh
defaults delete -g NSFileViewer
```

> If you set ForkLift as the default file viewer and you remove it from your system, Finder will automatically become the default one.
