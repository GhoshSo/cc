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
  measure: total_transaction_amount{
    type: sum
    sql: ${amount} ;;
    value_format: "$0.00"
    drill_fields: [date_year, merchant_city ,total_transaction_amount]
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
  measure: no_chip_transaction {
    label: "Count of Possible Fraudlent transaction"
    description: "The count of transaction which could be fraudulent transaction as there must be some error or the card is on the dark web and chip transaction is not used. If chip is used it is highly like it would be a fraud"
    type: number
    sql:  COUNTIF(${errors} IS NOT NULL
                            AND ${use_chip} != "Chip Transaction"
                            OR ${credit_card.card_on_dark_web} = true
)
 ;;
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
