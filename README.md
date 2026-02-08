# Quakes

An earthquake detection and analysis application that fetches real-time earthquake data from the USGS Earthquake API.

## Description

Quakes is a Python-based application that retrieves, parses, and displays earthquake data from the United States Geological Survey (USGS) Earthquake Hazards Program. The application fetches JSON data about recent seismic events and provides detailed information including magnitude, location, coordinates, and depth.

## Features

- **Real-time Data Retrieval**: Fetches earthquake data from USGS GeoJSON feeds
- **Significant Events Tracking**: Monitors significant earthquakes from the past 7 days
- **Detailed Event Information**: Displays:
  - Earthquake magnitude
  - Geographic location
  - Timestamp
  - Coordinates (latitude, longitude, depth)
  - User-reported felt experiences
- **Filtering Options**: Filter earthquakes by magnitude (e.g., magnitude ≥ 4.0)
- **Interactive Display**: Lists all recorded events with formatting

## Technologies

- **Python 3.x**
- **Swift** (82.6% of codebase - iOS/macOS component)
- **urllib**: For HTTP requests
- **json**: For parsing GeoJSON data
- **datetime**: For timestamp conversion

## Installation

1. Clone the repository:
```bash
git clone https://github.com/th30d0re/quakes.git
cd quakes
```

2. Ensure you have Python 3.x installed:
```bash
python --version
```

3. No additional dependencies required (uses Python standard library)

## Usage

Run the main Python script:

```bash
python quakes.py
```

The application will:
1. Connect to the USGS Earthquake API
2. Retrieve significant earthquakes from the past week
3. Display the total number of events
4. List all earthquake events with detailed information
5. Allow you to choose a specific event for more details

### Example Output

```
Result Code: 200
USGS Significant Earthquakes, Past Week
5 events occurred
------------------------

Printing events:
Southern California @ 2026-02-07 14:23:15
 > Coordinates: Latitude:-117.5°,Longitude:34.2°, Depth:10.5
----------------
```

## Data Source

This application uses the USGS Earthquake Hazards Program API:
- **Significant Earthquakes (Past Week)**: https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_week.geojson
- **2.5+ Magnitude (Past Day)**: http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson

## Functions

- `lab10()`: Main function to fetch and display significant earthquakes
- `ch5_2()`: Fetches earthquakes with magnitude 2.5+ from the past day
- `printResults(data)`: Parses and prints earthquake data with filtering
- `eprint(event)`: Prints detailed information for a single earthquake event

## License

This project includes a LICENSE file. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.

## Acknowledgments

- Data provided by the [USGS Earthquake Hazards Program](https://earthquake.usgs.gov/)
- GeoJSON earthquake feeds documentation: https://earthquake.usgs.gov/earthquakes/feed/

---

**Note**: This application was created as a learning project (Lab 10) to demonstrate working with web APIs and JSON data in Python.