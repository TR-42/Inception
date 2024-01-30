リモートファイルのダウンロード数を削減するために、ダウンロードしたファイルをキャッシュすることができます。

```sh
REDIS_CACHE_PLUGIN_VERSION="2.5.0"
curl -O "https://downloads.wordpress.org/plugin/redis-cache.${REDIS_CACHE_PLUGIN_VERSION}.zip"

WP_VERSION="6.4.2"
curl -O "https://wordpress.org/wordpress-${WP_VERSION}.tar.gz"
```
