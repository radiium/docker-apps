# Docker wordpress

## Description:
Setup docker setup for:
- Wordpress (latest)
- MySQL (5.7)
- phpMyAdmin


## Usage:


#### Configuration:
[./config/uploads.ini](./config/uploads.ini) => Server upload and post size  
[./config/wp-config-sample](./config/wp-config-sample) => Sample wordpress configuration (used )  
[.env](./.env) => Configure:

| Keys | Descriptions |
| ------------- | ------------- |
| MYSQL_ROOT_PASSWORD | MySQL root password |
| MYSQL_DATABASE | Wordpress database  |
| MYSQL_USER | Wordpress database user  |
| MYSQL_PASSWORD | Wordpress database user password |
| WP_DB_HOST | MySQL host  |
| WP_PREFIX | Wordpress database table prefix |
| WP_PORT | External Wordpress ports |
| DB_PORT | External MySQL ports |
| PMA_PORT | External phpMyAdmin ports |

#### Init (run only once first!)
```bash
chmod +x ./init.sh && ./init.sh
```

#### Start docker stacks
```bash
docker-compose up
```
