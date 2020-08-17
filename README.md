# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#　テーブル設計

## users テーブル

| Column                | Type   | Option      |
| --------------------- | ------ | ----------- |
| nick_name             | string | null: false |
| email                 | string | null: false |
| password              | string | null:false  |
| first_name            | string | null:false  |
| last_name             | string | null:false  |
| katakana_first_name   | string | null:false  |
| katakana_last_name    | string | null:false  |
| birthday              | string | null:false  |
| password_confirmation | string | null:false  |

### Association

- has_many :items
- has_one :customers

## items テーブル

| Column           | Type      | Option                       |
| ---------------- | --------- | ---------------------------- |
| item_image       | string    | null:false                   |
| item_name        | string    | null:false                   |
| item_description | text      | null:false                   |
| price            | integer   | null:false                   |
| item-status      | string    | null:false                   |
| category         | string    | null:false                   |
| delivery_charge  | string    | null:false                   |
| delivery_source  | string    | null:false                   |
| delivery_days    | string    | null:false                   |
| user             | references | null:false, foreign_key:true |

### Association

- belongs_to :users
- belongs_to :customer

## customers　テーブル

| Column           | Type   | Option     |
| ---------------- | ------ | ---------- |
| credit_number    | string | null:false |
| credit_date      | string | null:false |
| credit_code      | string | null:false |
| delivery_address | string | null:false |
| post_number      | string | null:false |
| prefectures      | string | null:false |
| city             | string | null:false |
| block            | string | null:false |
| building_name    | string |            |
| tel              | string | null:false |
| user             | references | null:false, foreign_key:true |

### Association テーブル

- belongs_to : users
- belongs_to : items