# GNOME Role

this role handles GNOME-specific desktop environment configuration.

## What it does

- sets the GNOME desktop wallpaper using `gsettings`
- depends on the `theme` role to place wallpaper files in the appropriate location

## Non-automated tasks

### setting the login screen BG and theme

For this, use [gdm-settings](https://github.com/gdm-settings/gdm-settings):

```sh
sudo apt install gdm-settings libglib2.0-dev-bin
```
