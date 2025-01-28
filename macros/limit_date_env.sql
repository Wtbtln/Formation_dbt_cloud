{%  macro limit_date_dev(col_name,duree_limit=3) -%}
    {%-  if target.name=='dev' -%}
        where {{col_name}} >= dateadd('day',-{{duree_limit}},current_timestamp() )
    {%  endif   -%}
{%  endmacro %}