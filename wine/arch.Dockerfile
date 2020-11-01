FROM archlinux:20200908

#Enable Multilib (for wine): https://wiki.archlinux.org/index.php/Official_repositories#multilib
RUN echo "\n\
[multilib]\n\
Include = /etc/pacman.d/mirrorlist\n\
" >> /etc/pacman.conf

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm wine winetricks sudo

#gnu-netcat python2 which playonlinux
# xorg-xrdb

ENV WINEARCH=win32
ENV WINEPREFIX=~/.winelr5
RUN winetricks atmlib corefonts wintrust msasn1 vcrun2008 ie6
RUN mkdir -p $WINEPREFIX/drive_c/windows/temp/syswow64/
RUN cp /shared/Wine/winhttp.dll $WINEPREFIX/drive_c/windows/temp/syswow64/winhttp.dll
RUN cp /shared/Wine/WININET.DLL $WINEPREFIX/drive_c/windows/temp/syswow64/wininet.dll

# POL_Wine_OverrideDLL "native, builtin" "winhttp"
# POL_Wine_OverrideDLL "native, builtin" "wininet"
 
#WINEARCH=win32 WINEPREFIX=~/.winelr5 winetricks winxp wmpcodecs FontsSmoothRGB
#WINEARCH=win32 WINEPREFIX=~/.winelr5 winetricks win7 gdiplus

RUN useradd -m -p testpw -G wheel poluser
USER poluser
#RUN echo "wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# on host: xhost +
#USER=poluser playonlinux