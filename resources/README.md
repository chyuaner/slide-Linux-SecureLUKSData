與現代化開機相關的設定檔與腳本
===

裡面這些檔案是直接從我現在的電腦直接**原封不動的**按照原有的檔案放置位置結構，直接複製到這裡給你參考。雖然大部分可以直接全貼，但部份內容（像是/efi掛載位置、你要採用的mkinitcpio MODULES），請自行依照你的情況調整！

## 主要參考別人寫的腳本
* [Manjaro SecureBoot Setup Guide](https://gist.github.com/Jai-JAP/5d5d9f67f19e5e5eaf6825b371a17d5d)
* [Enable SecureBoot in Manjaro](https://gist.github.com/junalmeida/13aadd6892ef6a119d0d229db341f382)

## 注意事項

### 安裝新的Linux核心時
`/etc/mkinitcpio.d/` 裡面的，是在Manjaro中安裝新的Linux核心時，會自動產生出來的！
請將 `default_uki` 解除註解，並根據你掛載的 /efi 實際位置調整。

### 此範例的默認位置

#### MOK SSL 放置位置
我都是放在 /usr/share/secureboot/keys ，我的電腦資料夾內會有以下這些檔案
```
       export20250526        MOK.auth        MOK.crt        MOK.esl        MOK.pem 
       GUID.txt              MOK.cer         MOK.der        MOK.key
```

#### 注意 /efi 分割區實際掛載路徑
我自己是放在 `/efi` ，所以我的腳本都已經做好對應修改了。

雖然別人的[Gist腳本範例](#主要參考別人寫的腳本)是放在 `/boot/efi` ，但我後續長期使用時，發現Manjaro安裝新核心產生的新的 `/etc/mkinitcpio.d/` 裡面的 `default_uki` 預設是指向 `/efi` ，所以後來為了配合Manjaro原有設計，我重新改掛載到 `/efi` 了。

## Grub 新增UKI選項的腳本
請參考 <https://github.com/chyuaner/grub.d-custom>