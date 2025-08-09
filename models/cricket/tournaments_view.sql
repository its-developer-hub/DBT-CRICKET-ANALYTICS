-- Read data from Tournaments_view to Tournaments table

{{ config(materialized='table') }}

SELECT  value:id::string AS Tournament_ID,
        value:name::string AS Tournament_Name,
        value:sport:name::string AS Sports_Name,
        value:type::string AS Tournament_type,
        value:category:name::string AS Tournament_Category,
        value:gender::string AS Tournament_Gender,
        value:current_season:year::string AS Year,
        value:current_season:name::string AS Current_Season_Name,
        value:current_season:start_date::string AS Season_Start_Date,
        value:current_season:end_date::string AS Season_End_Date
FROM {{ source('cricket','tournaments') }} t,
   lateral flatten ( input => json_data:tournaments ) f;
