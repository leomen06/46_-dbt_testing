generic_regex.sql
{% test generic_regex(model, column_name, regex, tags) %}

    select {{ column_name }}
    from {{ model }}
    where not {{ column_name }} ~* '{{ regex }}'
    
{% endtest %}