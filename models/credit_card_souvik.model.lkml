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

explore: transaction {}

