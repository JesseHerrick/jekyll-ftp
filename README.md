# Jekyll-FTP

![Version](https://badge.fury.io/rb/jekyll-ftp.png)

## Commands
* `jekyll-ftp deploy` - Deploy your site via FTP with the preconfigured settings.
* `jekyll-ftp clean` - Remove all the files from the preconfigured `remote_dir`.

## Configuring your `_config.yml` File
Since [Jekyll](https://github.com/mojombo/jekyll) uses `_config.yml`, Jekyll-FTP uses this too.

Jekyll-FTP needs 3 configuration settings:
* `username` - Your FTP server username.
* `server_url` - The URL for your FTP server (can also be an FTP).
* `remote_dir` - The remote directory where your site is to be deployed.

```yaml
username: UserName
server_url: ftp.myserver.com
remote_dir: /public_html
```

If you still don't get it, [here's an example](https://gist.github.com/JesseHerrick/6965950).
