short_month_day = "%b %-d"

long_month_day = "%B %-d"

# Date
Date::DATE_FORMATS[:default] = "#{short_month_day}, %Y"
# Feb 19, 2021
Date::DATE_FORMATS[:day_number] = "%-d"
# 19
Date::DATE_FORMATS[:date_with_day] = "%A, #{long_month_day}"
# Friday, February 19
Date::DATE_FORMATS[:full_date_with_day] = "%A, #{short_month_day}, %Y"
# Friday, Feb 19, 2021
Date::DATE_FORMATS[:short_date_with_year] = "%a, #{short_month_day}, %Y"
# Friday, Feb 19, 2021
Date::DATE_FORMATS[:short_date_with_day] = "%a, #{short_month_day}"
# Fri, Feb 19
Date::DATE_FORMATS[:short_date] = short_month_day
# Feb 19
Date::DATE_FORMATS[:day] = "%A"
# Friday
Date::DATE_FORMATS[:year] = "%Y"
# month
Date::DATE_FORMATS[:month] = "%b"

Date::DATE_FORMATS[:month_year] = "%b %Y"
# 2021
Date::DATE_FORMATS[:php_date] = "%Y-%m-%d"
# 2021-02-19

Date::DATE_FORMATS[:iso_date] = "%Y-%m-%d"

Date::DATE_FORMATS[:date] = "#{short_month_day}, %Y"

Time::DATE_FORMATS[:default] = "#{short_month_day}, %Y, %l:%M %P"

Time::DATE_FORMATS[:default_with_seconds] = "#{short_month_day}, %Y, %l:%M:%S %P"

Time::DATE_FORMATS[:time] = "%l:%M %P"

Time::DATE_FORMATS[:time_24h] = "%H:%M"

Time::DATE_FORMATS[:short_date] = short_month_day

Time::DATE_FORMATS[:date] = "#{short_month_day}, %Y"

Time::DATE_FORMATS[:full_date_with_day] = "%A, #{short_month_day}, %Y"

Time::DATE_FORMATS[:php_date] = "%Y-%m-%d"

Time::DATE_FORMATS[:month_year] = "%b %Y"

Time::DATE_FORMATS[:swipe_time] = "%l:%M:%S %P #{short_month_day}"

Time::DATE_FORMATS[:iso_date] = "%Y-%m-%d"
