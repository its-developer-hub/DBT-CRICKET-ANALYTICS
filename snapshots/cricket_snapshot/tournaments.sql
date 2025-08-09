{% snapshot tournaments() %}

{{

    config(
      target_database = 'dev_stage_db',
      target_schema = 'hist_stage',
      unique_key = 'tournament_id',
      strategy = 'check',
      check_cols = 'all',
      dbt_valid_to_current = "to_date('9999-12-31')",
      hard_deletes = 'new_record',

      snapshot_meta_column_names={
          'dbt_valid_from': 'effective_from',
          'dbt_valid_to': 'effective_to',
          'dbt_is_deleted': 'delete_ind'
      }
    )
}}


select * from {{ source('cricket','tournaments_view') }}

{% endsnapshot %}