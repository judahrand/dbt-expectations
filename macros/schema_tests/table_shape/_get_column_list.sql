{%- macro _get_column_list(model, transform="upper") -%}
    {%- if (model is mapping and obj.get('metadata', {}).get('type', '').endswith('Relation')) -%}
        {%- set relation_columns = adapter.get_columns_in_relation(model) -%}
    {%- else -%}
        {%- set relation_columns = adapter.get_columns_in_query(model) -%}
    {%- endif -%}

    {%- set relation_column_names = relation_columns | map(attribute="name") | map(transform) | list -%}
    {%- do return(relation_column_names) -%}
{%- endmacro -%}
