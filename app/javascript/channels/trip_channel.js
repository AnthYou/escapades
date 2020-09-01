import consumer from "./consumer";

const initTripCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.tripId;

    consumer.subscriptions.create({ channel: "TripChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initTripCable };
