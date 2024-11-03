import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ["score", "bestScore", "card"];

  connect() {
    console.log("Game Controller Initialized");
    this.clickedCards = new Set();
    this.currentScore = 0;
    this.bestScore = 0;
    this.characterPool = this.createCharacterPool();
  }

  createCharacterPool() {
    console.log("Creating Character Pool"); // Debug log
    return Array.from(this.cardTargets).map(card => ({
      id: card.dataset.cardId,
      imageUrl: card.querySelector('img').src,
      name: card.querySelector('p').innerText,
    }));
  }

  startGame() {  
    this.clickedCards.clear(); // Clear any previously clicked cards
    this.currentScore = 0; // Reset score
    this.updateScore(); // Update score display
    this.shuffleCards(); // Shuffle cards for the game start
  }  

  clickCard(event) {
    console.log("Card clicked:", event.currentTarget.dataset.cardId); // Debug log
    const cardId = event.currentTarget.dataset.cardId;
    console.log(`Card clicked with ID: ${cardId}`);
  
    if (this.clickedCards.has(cardId)) {
      this.gameOver();
    } else {
      this.clickedCards.add(cardId);
      this.currentScore++;
      this.updateScore();
      this.replaceCard(event.currentTarget); // Replace clicked card
      this.shuffleCards(); // Shuffle cards after clicking
    }
  }

  gameOver() {
    alert("Game Over! Your score: " + this.currentScore);
    this.saveScore(this.currentScore); // Save score to the database
    this.resetGame();
  }

  saveScore(score) { // Accept score as a parameter
    const gameId = this.element.dataset.gameId; // Get the game ID
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content'); // Get the CSRF token

    fetch(`/games/${gameId}/save_score`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ score: score }), // Use the score parameter here
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));    
  }

  resetGame() {
    this.clickedCards.clear();
    this.currentScore = 0;
    this.updateScore();
    this.characterPool = this.createCharacterPool(); // Create a new character pool for the new game
  }

  updateScore() {
    this.scoreTarget.innerText = this.currentScore; // Update current score display
    if (this.currentScore > this.bestScore) {
      this.bestScore = this.currentScore; // Update best score if current score is higher
      this.bestScoreTarget.innerText = this.bestScore; // Update best score display
    }
  }  

  replaceCard(cardElement) {
    const randomCharacter = this.getRandomCharacter();
    if (randomCharacter) {
      cardElement.querySelector('img').src = randomCharacter.imageUrl;
      cardElement.querySelector('p').innerText = randomCharacter.name;
      cardElement.dataset.cardId = randomCharacter.id; // Update the card's ID
    }
  }

  getRandomCharacter() {
    const remainingCharacters = this.characterPool.filter(character => !this.clickedCards.has(character.id));
    if (remainingCharacters.length === 0) {
      return null;
    }
    const randomIndex = Math.floor(Math.random() * remainingCharacters.length);
    return remainingCharacters[randomIndex];
  }

  shuffleCards() {
    const board = this.element.querySelector('#game-board');
    const cards = Array.from(this.cardTargets);
    
    // Shuffle the cards randomly
    cards.sort(() => Math.random() - 0.5);
    
    // Append each card back to the board
    cards.forEach(card => board.appendChild(card)); // Append shuffled cards back to the board
  }
}
