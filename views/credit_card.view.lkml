view: credit_card {
  sql_table_name: `cc_fraud.credit_card` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: acct_open_date {
    type: string
    sql: ${TABLE}.acct_open_date ;;
  }
  dimension: card_brand {
    type: string
    sql: ${TABLE}.card_brand ;;
  }
  dimension: card_number {
    type: number
    sql: ${TABLE}.card_number ;;
  }
  dimension: card_on_dark_web {
    type: yesno
    sql: ${TABLE}.card_on_dark_web ;;
  }
  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }
  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }
  dimension: credit_limit {
    type: number
    sql: ${TABLE}.credit_limit ;;
  }
  dimension: cvv {
    type: number
    sql: ${TABLE}.cvv ;;
  }
  dimension: expires {
    type: string
    sql: ${TABLE}.expires ;;
  }
  dimension: has_chip {
    type: yesno
    sql: ${TABLE}.has_chip ;;
  }
  dimension: num_cards_issued {
    type: number
    sql: ${TABLE}.num_cards_issued ;;
  }
  dimension: year_pin_last_changed {
    type: number
    sql: ${TABLE}.year_pin_last_changed ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
    html: {{ value | times: 100 | round: 2 }}% ;;
  }
}
