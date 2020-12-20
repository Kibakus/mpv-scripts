# mpv-scripts
A small collection of scripts for the MPV player to make your life a bit better.

# Audio WebDAV AND Sub WebDAV
Auto connection of external subtitles and sound, using the "WEBDAV" protocol. The connection is explicit due to explicitly specifying folders on the WebDAV server

Due to the limitation of the search for files on http in MPV, these scripts were created to facilitate video playback on an Android/iPhone device, but the scripts also work on Linux/Windows.

**mpv.conf**
```
audio-file-paths = RUS Sound: Rus Sound: RUS Sounds: Rus Sounds: Sound Rus: Sounds Rus
audio-file-auto = fuzzy

sub-file-paths = RUS Subs: Rus Subs: SUBS: Subs: subs: Sub: Rus Sub
sub-auto = fuzzy
sid = no

script = /storage/emulated/0/Android/media/is.xyz.mpv/AudioWebDAV.lua
script = /storage/emulated/0/Android/media/is.xyz.mpv/SubWebDAV.lua
(The location can be chosen by yourself)
```
## Apache WebDAV setup (Debian / Ubuntu)

```
sudo apt-get update
sudo apt-get install apache2
```
```
sudo mkdir /var/www/webdav
sudo chown -R www-data: www-data/var/www/
```
```
sudo a2enmod dav
sudo a2enmod dav_fs
```
```
sudo vi /etc/apache2/sites-available/000-default.conf
```
Find the **<VirtualHost>** section and add the following directives to it [Screenshot config](https://raw.githubusercontent.com/Kibakus/mpv-scripts/main/Screenshot.png):

```
Alias /webdav/var/www/webdav
<Directory /var/www/webdav>
DAV On
</Directory>
```

The DavLockDB directive specifies the path to the WebDAV locking database.
The Alias directive allows you to provide web access to any folder outside the document root. In this example, it links requests to http://**hostname**/webdav to /var/www/webdav.
The Directory directive specifies a number of other directives to be applied to the specified folder and all of its contents. In this example, the DAV directive specifies that WebDAV should be enabled for the /var/www/webdav directory.
```
sudo systemctl enable apache2
sudo systemctl restart apache2
```

### Custom path folder settings
```
sudo vi /etc/apache2/apache2.conf
```
**add**
```
<Directory /home/your_user/folder_public_html>
 Options Indexes FollowSymLinks
 AllowOverride None
 Require all granted
</Directory>
```
And add the user "www-data" to the group who can edit or read folders at will
```
sudo service apache2 restart
```
