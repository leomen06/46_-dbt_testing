select *
from {{ ref('dev_main_file_binary_ts') }}
where "file_content" is null