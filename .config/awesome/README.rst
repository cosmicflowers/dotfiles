nightfall theme
===================

-------------------------
My theme for Awesome WM 4.x
-------------------------

:Author: cosmicflowers
:Original Authors: Luca CPZ (base config/setup) & ok100 (base theme) & lucamanni (v1 icons only)
:Version: 2.4
:License: BY-NC-SA_
:Original Source: https://github.com/lcpz/awesome-copycats

Description
===========

My theme for the Awesome_ window manager, version 4.x.

Sample
=====

.. image:: https://i.imgur.com/XHdVWld.png

Installation
============

.. code-block:: shell

    $ git clone --recursive https://github.com/cosmicflowers/dotfiles.git
    $ mv -bv ./dotfiles/.config/awesome/* ~/.config/awesome && rm -rf ./dotfiles/.config/awesome

Notes
=====

This theme relies on lain_ for widgets and freedesktop for the menu. As of version 2.4, it now also uses feh for background display - this is an optional dependency though because awesome has it's own method of displaying backgrounds that you can revert to.  A clone of this responsitory will install all the necessary components except the fonts. **Be sure** to satisfy the icon font dependency if you plan on using v2.x.

Fonts used are SF Pro Text (main) + DroidSansMono Nerd Font (icons) + SF Mono (calendar only).

The v1 theme uses icons for the infobar, and is available to use for those who do not wish to install the nerd font. However, it is deprecated and will not be further updated.

Additional default software used: ::

    feh unclutter firefox scrot mpd mpc dmenu xsel slock urxvt 

.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0
.. _b0ab0d7: https://github.com/lcpz/awesome-copycats/tree/b0ab0d7837987be81b9195a36631df773113d491
.. _Awesome: http://github.com/awesomeWM/awesome
.. _lucamanni: https://github.com/lucamanni/awesome
.. _romockee: https://github.com/romockee/powerarrow
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _swordfischer: https://github.com/lcpz/awesome-copycats/issues/53
.. _foozer: http://dotshare.it/dots/499
.. _lain: https://github.com/lcpz/lain
.. _freedesktop: https://github.com/lcpz/awesome-freedesktop
.. _feh: https://feh.finalrewind.org/
.. _San Francisco fonts: https://developer.apple.com/fonts/
.. _Roboto: https://fonts.google.com/specimen/Roboto
.. _Nerd Font: https://nerdfonts.com/
.. _branches: https://github.com/lcpz/awesome-copycats/branches
