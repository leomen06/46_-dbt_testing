{{ config(materialized='table') }}

select *,
case
    when not file_content ~* 'binary_content_\d{2}' 
        or not file_path ~*'abfss:\/\/webmethods-[a-z0-9@\.]+dfs\.core\.windows\.net\/mustang\/regression\/\d{4}\/\d{2}\/\d{2}\/tns_mustang_regression_\d{9}_\d{14}' 
        or not file_name ~* 'tns_mustang_regression_\d{9}_\d{14}\.xml' then 'fail'
        --or not modification_time rlike '(202)[01234]-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-4])(:(0[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|60)){2}\.\d{6}' then 'fail'
    else 'pass'
end as status
from dev_main_file_binary_ts