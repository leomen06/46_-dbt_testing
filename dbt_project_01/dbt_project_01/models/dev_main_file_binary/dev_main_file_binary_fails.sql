{{ config(materialized='table') }}

select *
from dev_main_file_binary_ts
where file_path ~*'^abfss:\/\/webmethods-[a-z0-9@\.]+dfs\.core\.windows\.net\/mustang\/regression\/\d{4}\/\d{2}\/\d{2}\/tns_mustang_regression_\d{9}_\d{14}$'