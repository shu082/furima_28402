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

# テーブル設計

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
| birthday              | date   | null:false  |
| password_confirmation | string | null:false  |

### Association

- has_many :items
- has_many :items_managements

## items テーブル

| Column          | Type       | Option                       |
| --------------- | ---------- | ---------------------------- |
| image           | string     | null:false                   |
| name            | string     | null:false                   |
| description     | text       | null:false                   |
| price           | integer    | null:false                   |
| category        | integer    | null:false                   |
| delivery_charge | integer    | null:false                   |
| delivery_source | integer    | null:false                   |
| delivery_days   | integer    | null:false                   |
| user            | references | null:false, foreign_key:true |
| status          | integer    | null:false                   |

### Association

- belongs_to :user
- has_one :items_management

## addresses テーブル

| Column           | Type       | Option                       |
| ---------------- | ---------- | ---------------------------- |
| post_number      | string     | null:false                   |
| prefecture_id      | integer    | null:false                   |
| city             | string     | null:false                   |
| block            | string     | null:false                   |
| building_name    | string     |                              |
| tel              | string     | null:false                   |
| items_management | references | null:false, foreign_key:true ||


### Association

- belongs_to :items_management

## items_managements テーブル

| Column | Type       | Option                       |
| ------ | ---------- | ---------------------------- |
| user   | references | null:false, foreign_key:true |
| item   | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : address
