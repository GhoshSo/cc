connection: "cc"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: credit_card_souvik_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: credit_card_souvik_default_datagroup

explore: user_data {}

explore: credit_card {}

explore: transaction {
  persist_for: "480 hours"
  join: credit_card {
    type: left_outer
    relationship: many_to_one
    sql_on: ${transaction.card_id} = ${credit_card.id} ;;
  }

  join: user_data {
    type: left_outer
    sql_on: ${transaction.client_id} = ${user_data.id} ;;
    relationship: many_to_one
  }
### Asdding commit
}
