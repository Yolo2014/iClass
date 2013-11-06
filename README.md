# Brunch ERS skeleton

Using Coffee-script, Backbone.js, Stylue, Jade, Handlebars as the primary develop tools.

## Quick start

First, you need to install brunch in your global scope

    $ npm install -g brunch

Then, you can use our skeleton

    $ git clone git@172.17.0.20:brunch-skeleton.git <your-app-name>
    $ cd <your-app-name>
    $ rm -rf .git
    $ npm install
    $ cp app/config/config.sample.coffee app/config/config.coffee
    $ brunch w -s

## Usage

- Generators
  
  brunch generate page/list dir_name 生成page_view / list_view, item_view

- CSS general.styl 快速設置元素的CSS

  .vpan1. ... .vpan20 調整元素的height
  
  .mpan1. ... .mpan20 調整元素的margin

  .bpan1. ... .bpan20 調整元素的border

  .rpan1. ... .rpan20 調整元素的圓角

  .top-left, top-right, bottom-left, bottom-right 固定元素的位置至左上，右上，左下，右下

  .color_name 比如 .red, .green, .blue, .gray 設置文本[顏色]

  .bg + colr_name 比如 .bgred, .bgyellowgreen 設置背景[顏色]

  .color_name + bpan + n 比如 .redbpan2 設置邊框顏色為紅色，厚度2px

  .bpan + n + - + direction 比如 .bpan3-top 設置上邊框，厚度3px
  

[文本顏色]:http://www.crockford.com/wrrrld/color.html

## Views

- PageView

  這種View負責呈現`Page`，通常用來響應路由的改變


- ListView

  這種View負責呈現`collection`，通常負責制做多個負責呈現`model`的`ItemView`

- ItemView

  這種View負責呈現`model`，通常由`ListView`負責實例化

- View

  普通的`View`

## Mediator

- Backbone.mediator

  供系統全局使用的中間人，使得事件驅動開發更容易