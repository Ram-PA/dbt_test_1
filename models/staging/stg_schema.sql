version: 2

models:
  - name: stg_table1
    description: "Stage model for table1"
    columns:
      - name: ID
        description: "The primary key for this table"
        tests:
          - unique
          - not_null

  - name: stg_table2
    description: "Stage model for table2"
    columns:
      - name: ID
        description: "The primary key for this table"
        tests:
          - unique
          - not_null

  - name: stg_table3
    description: "Stage model for table3"
    columns:
      - name: ID
        description: "The primary key for this table"
        tests:
          - unique
          - not_null

  - name: stg_table4
    description: "Stage model for table4"
    columns:
      - name: ID
        description: "The primary key for this table"
        tests:
          - unique
          - not_null