view: transaction {
  sql_table_name: `cc_fraud.transaction` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }
  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }
  dimension: errors {
    type: string
    sql: ${TABLE}.errors ;;
  }
  dimension: mcc {
    type: number
    sql: ${TABLE}.mcc ;;
  }
  dimension: merchant_city {
    type: string
    sql: ${TABLE}.merchant_city ;;
  }
  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }
  dimension: merchant_state {
    type: string
    sql: ${TABLE}.merchant_state ;;
  }
  dimension: use_chip {
    type: string
    sql: ${TABLE}.use_chip ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
