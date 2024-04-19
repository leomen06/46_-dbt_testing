generic_file_path_regex.sql
{% test generic_file_path_regex(model, column_name) %}

    select {{ column_name }}
    from {{ model }}
    where not {{ column_name }} ~*'^abfss:\/\/webmethods-[a-z0-9@\.]+dfs\.core\.windows\.net\/mustang\/regression\/\d{4}\/\d{2}\/\d{2}\/tns_mustang_regression_\d{9}_\d{14}$'

{% endtest %}