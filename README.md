Fantasy baseball
===

## 執行順序

- rake db:seed:baseball_position
- rake cpbl_team:update
- rake cpbl_team_roster:update
- rake cpbl_schedule:update

## 系統需求

* Ruby 2.6.6
* PostgreSQL 9.6+
* Node.js 8.0 (以上)

## 環境設定

以下的設定皆以 macOS 為主。

### Homebrew

在 macOS 需要有 [Homebrew](https://brew.sh/index_zh-tw) 來輔助安裝環境。

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

執行完畢後可以透過 `brew doctor` 確認是否可用。

### Ruby

為了配合多個版本的環境，建議使用 `rbenv` 或者 `rvm` 來管理 Ruby 環境。

```bash
# 選用 rbenv
brew install rbenv

# 選用 rvm
brew install rvm
```

完成後請參考終端機顯示的訊息設定 `.bashrc` 或者其他 Shell 設定檔。

```bash
# 選用 rbenv
rbenv install 2.6.6

# 選用 rvm
rvm install 2.6.6
```

完成後需要先將 Bundler 安裝到新安裝的 Ruby 環境中（rvm 可能會先預裝完畢）

```bash
# 先確認是否在正確的 Ruby 版本執行
ruby -v
# => ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-darwin17]

gem install bundler
```
### PostgreSQL

請注意不要直接輸入 `postgresql` 否則會安裝到最新版的 PostgreSQL

```bash
# 安裝
brew install postgresql@9.6

# 啟動伺服器
brew services start postgresql@9.6
```

### Node.js

Rails 需要 JavaScript Runtime 一般會使用 Node.js。

```bash
brew install node
```

Webpacker 使用 Yarn 管理安裝的 JavaScript 套件，我們還需要將 Yarn 安裝進來。

```bash
brew install yarn
```

### Rails

請先透過 git 將專案下載到本地端。

```bash
# 切換到專案目錄
cd fantasy_baseball

# 安裝 Rails 所需套件
bundle install

# 設定 git hook
bundle exec overcommit --install
```

Overcommit 會做以下檢查：

1. commit 前：使用 rubocop 檢查語法
2. push 前：使用 brakeman 檢查安全性問題

```bash
# 設定資料庫
bundle exec rake db:create

# 更新資料庫到最新版
bundle exec rake db:migrate
```

## 執行專案

### Rails 伺服器

```bash
# 這是 rails server 的縮寫
rails s
```

開啟後預設可以透過 `http://localhost:3000` 看到網站

#### PendingMigration 錯誤

這是因為最新版本的資料庫已經被更改，但是本機的資料庫還沒有被更新。

```bash
bundle exec rake db:migrate
```

執行 `db:migrate` 指令更新資料庫即可。

### 運行測試

這個專案使用 RSpec 進行測試，可以透過執行以下指令運行

```bash
bundle exec rspec
```

### Ruby 語法檢查

這個功能會在 commit 前自動執行，必要時可以手動進行

```bash
bundle exec rubocop
```

### Ruby 安全性檢查

這個功能會在 push 前自動執行，必要時可以手動進行

```bash
bundle exec brakeman
```

### 建立 .env 檔案

建立 `.env` 檔案，並依據 local 開發環境需求修改設定內容。

```bash
cp .env.example .env
```

## 部署

這個專案使用 Capistrano 進行部署，請先確定有權限透過 `deployer` 帳號 SSH 到伺服器上。

```bash
cap [ENV] deploy
```

假設要部署到測試（Staging）環境，請使用以下指令

```bash
cap staging deploy
```

如果是正式環境，則使用以下指令

```bash
cap production deploy
```

過程中會詢問要使用的 Git Branch，預設為 master branch，如果需要測試某個 Git Branch 請先將他上傳到 GitHub 上，並且和團隊成員確認後手動輸入 branch 再進行部署跟測試。
