# RAM Disk

```bash
# 16 GiB
diskutil partitionDisk $(hdiutil attach -nomount ram://32768000) 1 GPTFormat APFS 'ramdisk' '100%'
```
