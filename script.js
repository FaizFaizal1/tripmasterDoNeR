function updateDateTime() {
    const now = new Date();

    const options = {
        weekday: 'short', 
        year: 'numeric',
        month: 'short', 
        day: 'numeric',
        hour: '2-digit', 
        minute: '2-digit', 
        second: '2-digit', 
        hour12: true, 
    };

    const formattedDateTime = now.toLocaleDateString(undefined, options);

    const datetimeElement = document.getElementById('current-datetime');
    if (datetimeElement) {
        datetimeElement.textContent = formattedDateTime;
    }
}

updateDateTime();

setInterval(updateDateTime, 1000);