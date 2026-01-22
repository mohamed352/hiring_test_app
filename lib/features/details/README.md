# Stadium Details Feature

This feature handles the display and interaction for specific stadium details.

## Components

### Cubit: `DetailsCubit`

Manages the state of the details screen, including:

- Loading initial stadium-specific data.
- Handling sport category selection.

### Widgets

- **DetailsHeader**: Displays the stadium representative image and back button.
- **DetailsContent**: Contains the stadium name, location, sport selection horizontal list, and description.
- **BookNowButton**: A persistent call-to-action button at the bottom of the screen.

## State Management

Uses `DetailsState` (Freezed) with the following states:

- `initial`: Default state.
- `loading`: Shown during data fetch.
- `loaded`: Contains the list of sports and the currently selected sport.
- `error`: Shown if data fails to load.

## Data Mapping

Currently uses mock data within the Cubit, but structured to receive a `StadiumModel` via the router in a production environment.
