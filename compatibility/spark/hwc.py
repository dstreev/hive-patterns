from pyspark.sql import SparkSession
from pyspark_llap import HiveWarehouseSession

import sys

spark = SparkSession.builder.appName("Validate").getOrCreate()

hive = HiveWarehouseSession.session(spark).build()

DB = sys.argv[1]
PLACEHOLDER = sys.argv[2]

print DB + PLACEHOLDER
