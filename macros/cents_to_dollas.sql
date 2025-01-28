{%  macro cents_to_dollas(column_name,decimal_limit=2)  -%}
    round( 1.0 * {{column_name}} / 100, {{decimal_limit}} )
{%  endmacro %}