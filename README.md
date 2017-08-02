# fxserver-esx_taxijob
FXServer ESX Taxi Job

[REQUIREMENTS]

* Auto mode
No need to download another resource

* Player management (billing and boss actions)
- esx_society => https://github.com/FXServer-ESX/fxserver-esx_society
- esx_billing => https://github.com/FXServer-ESX/fxserver-esx_billing

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository
```
git clone https://github.com/FXServer-ESX/fxserver-esx_taxijob esx_taxijob
```
3) * Auto mode : Import esx_taxijob_minimal.sql in your database
   * Player management : Import esx_taxijob_full.sql in your database

4) Add this in your server.cfg :

```
start esx_taxijob
```
5) If you want player management you have to set Config.EnablePlayerManagement to true in config.lua
