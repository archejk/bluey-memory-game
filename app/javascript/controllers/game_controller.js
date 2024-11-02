import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  connect() {
    this.cards = this.element.querySelectorAll('.card');
    this.selectedCards = [];
    this.matchedCards = [];

    this.cards.forEach(card => {
      card.addEventListener('click', () => this.selectCard(card));
    });
  }

  selectCard(card) {
    if (this.selectedCards.length < 2 && !card.classList.contains('matched')) {
      card.classList.add('flipped');
      this.selectedCards.push(card);

      if (this.selectedCards.length === 2) {
        this.checkForMatch();
      }
    }
  }

  checkForMatch() {
    const [card1, card2] = this.selectedCards;
    const isMatch = card1.dataset.cardName === card2.dataset.cardName;

    if (isMatch) {
      card1.classList.add('matched');
      card2.classList.add('matched');
      this.matchedCards.push(card1, card2);
    }

    setTimeout(() => {
      this.selectedCards.forEach(card => card.classList.remove('flipped'));
      this.selectedCards = [];
    }, 1000);
  }
}