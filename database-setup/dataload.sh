for i in products.json;
do
  python parse_metadata_json.py $i;
  ./cassandra-loader -f cronos_products.csv -host $CQLSH_HOST -port $CQLSH_PORT -schema "cronos.products(asin, title, description, price, imUrl, also_bought, also_viewed, bought_together, buy_after_viewing, brand, categories,num_reviews,num_stars,avg_stars)" -maxInsertErrors 10000 -maxErrors 10000 -charsPerColumn 256000;
  ./cassandra-loader -f cronos_product_rankings.csv -host $CQLSH_HOST -port $CQLSH_PORT -schema "cronos.product_rankings(asin, category, sales_rank, title, price, imurl, num_reviews, num_stars, avg_stars)" -maxInsertErrors 10000 -maxErrors 10000 -charsPerColumn 256000;
  rm *.csv*
done
