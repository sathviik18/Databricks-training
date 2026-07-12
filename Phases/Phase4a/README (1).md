# Phase 4a – Bucketing & Segmentation in PySpark

## Objective

Implement customer segmentation techniques in PySpark by categorizing customers based on spending and comparing different bucketing methods for business analysis.

## Topics Covered

* Fixed-rule segmentation (Gold, Silver, Bronze)
* Customer segment analysis
* Quantile-based segmentation
* Bucketizer
* Window functions (`percent_rank`)
* Comparing segmentation techniques
* SQL and PySpark DataFrame operations

## Tasks Performed

* Classified customers into Gold, Silver, and Bronze segments.
* Counted customers in each segment.
* Created quantile-based customer segments.
* Applied `Bucketizer` for numerical bucketing.
* Used `percent_rank()` to rank customers by spending.
* Compared different segmentation methods.

## Key PySpark Concepts

* `when()`
* `withColumn()`
* `groupBy()`
* `count()`
* `approxQuantile()`
* `Bucketizer`
* `Window`
* `percent_rank()`
* `createOrReplaceTempView()`
