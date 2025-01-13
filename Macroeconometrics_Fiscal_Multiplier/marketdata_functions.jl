using MarketData
using Plots
using Dates

# The following function identifies the frequency of the data. It takes in a vector of dates, obtained from
# the TimeArray object, and returns a string indicating the frequency of the data – either "monthly", "quarterly",
# or "annual".
function get_frequency(dates::Vector{Date})
    freq = "monthly"
    
    if length(dates) > 1
        if Dates.month(dates[2]) - Dates.month(dates[1]) == 3
            freq = "quarterly"
        elseif Dates.month(dates[2]) - Dates.month(dates[1]) == 12
            freq = "annual"
        end
    end

    return freq
end

# The following function reformats the dates to be more readable. It takes in a vector of dates, obtained from
# the TimeArray object, and a string indicating the frequency of the data. It returns a vector of strings
# containing the reformatted dates. Monthly data is reformatted to "Jan 2000", quarterly data is reformatted
# to "Q1 2000", and annual data is reformatted to "2000".
function reformat_dates(dates::Vector{Date}, freq::String)
    # Convert the dates from Date objects to strings
    dates_str = Dates.format.(dates, "mm yyyy")

    if freq == "monthly"
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        for i in 1:9
            dates_str = replace.(dates_str, "0$(i) " => "$(months[i]) ")
        end
        for i in 10:12
            dates_str = replace.(dates_str, "$(i) " => "$(months[i]) ")
        end
    elseif freq == "quarterly"
        dates_str = replace.(dates_str, r"01 " => "Q1 ")
        dates_str = replace.(dates_str, r"04 " => "Q2 ")
        dates_str = replace.(dates_str, r"07 " => "Q3 ")
        dates_str = replace.(dates_str, r"10 " => "Q4 ")
    elseif freq == "annual"
        dates_str = replace.(dates_str, r"01 " => "")
    end

    return dates_str
end

function plot_marketdata(; data, seriesname, saveplot::Bool=false)
    # Extract the dates and values from the data
    dates = timestamp(data)
    data_values = values(data)
    
    # Get the frequency of the data
    freq = get_frequency(dates)
    
    # Reformat the dates
    dates_reformatted = reformat_dates(dates, freq)

    num_x_ticks = Dict("annual" => 12, "quarterly" => 8, "monthly" => 9)

    plt_xticks::Int64 = round(Int64, length(dates_reformatted)/num_x_ticks[freq])

    plt = plot(
        data_values, title=seriesname, legend=false,
        xticks=(1:plt_xticks:length(dates_reformatted), dates_reformatted[1:plt_xticks:length(dates_reformatted)]),
        formatter=:plain, size=(850, 600), dpi=300)
    
    # Save the plot
    if saveplot == true
        savefig(seriesname * ".png")
    end

    return plt
end
    

function retrieve_marketdata(; source::String, identifier::String)
    # Retrieve the data
    local data
    if source == "fred"
        data = fred(identifier)
    elseif source == "ons"
        data = ons(identifier)
    elseif source == "yahoo"
        data = yahoo(identifier)
    else
        throw(ArgumentError("The source must be either 'fred', 'ons', or 'yahoo'."))
    end
    
    return data
end