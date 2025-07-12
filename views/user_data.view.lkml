view: user_data {
  sql_table_name: `cc_fraud.user_data` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: birth_month {
    type: number
    sql: ${TABLE}.birth_month ;;
  }
  dimension: birth_year {
    type: number
    sql: ${TABLE}.birth_year ;;
  }
  dimension: credit_score {
    type: number
    sql: ${TABLE}.credit_score ;;
  }
  dimension: current_age {
    type: number
    sql: ${TABLE}.current_age ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: num_credit_cards {
    type: number
    sql: ${TABLE}.num_credit_cards ;;
  }
  dimension: per_capita_income {
    type: number
    sql: ${TABLE}.per_capita_income ;;
  }
  dimension: retirement_age {
    type: number
    sql: ${TABLE}.retirement_age ;;
  }
  dimension: total_debt {
    type: number
    sql: ${TABLE}.total_debt ;;
  }
  dimension: yearly_income {
    type: number
    sql: ${TABLE}.yearly_income ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
