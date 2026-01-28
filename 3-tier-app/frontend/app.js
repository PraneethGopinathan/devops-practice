// API Configuration
const API_URL = 'http://localhost:8000';

// DOM Elements
const pollQuestion = document.getElementById('poll-question');
const optionsContainer = document.getElementById('options-container');
const addOptionBtn = document.getElementById('add-option-btn');
const createPollBtn = document.getElementById('create-poll-btn');
const pollsContainer = document.getElementById('polls-container');
const refreshPollsBtn = document.getElementById('refresh-polls-btn');
const toast = document.getElementById('toast');

// Add new option input
addOptionBtn.addEventListener('click', () => {
    const optionCount = optionsContainer.querySelectorAll('.option-input').length;
    const newOption = document.createElement('input');
    newOption.type = 'text';
    newOption.className = 'option-input';
    newOption.placeholder = `Option ${optionCount + 1}`;
    optionsContainer.appendChild(newOption);
});

// Create poll
createPollBtn.addEventListener('click', async () => {
    const question = pollQuestion.value.trim();
    const optionInputs = optionsContainer.querySelectorAll('.option-input');
    const options = Array.from(optionInputs)
        .map(input => input.value.trim())
        .filter(value => value !== '');

    if (!question) {
        showToast('Please enter a poll question', 'error');
        return;
    }

    if (options.length < 2) {
        showToast('Please add at least 2 options', 'error');
        return;
    }

    try {
        const response = await fetch(`${API_URL}/polls/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                question: question,
                options: options
            })
        });

        if (response.ok) {
            showToast('Poll created successfully!', 'success');
            pollQuestion.value = '';
            optionsContainer.innerHTML = `
                <input type="text" class="option-input" placeholder="Option 1">
                <input type="text" class="option-input" placeholder="Option 2">
            `;
            loadPolls();
        } else {
            showToast('Failed to create poll', 'error');
        }
    } catch (error) {
        showToast('Error connecting to server', 'error');
        console.error('Error:', error);
    }
});

// Load all polls
async function loadPolls() {
    try {
        const response = await fetch(`${API_URL}/polls/`);
        const polls = await response.json();

        if (polls.length === 0) {
            pollsContainer.innerHTML = '<p class="loading">No polls available. Create one above!</p>';
            return;
        }

        pollsContainer.innerHTML = '';
        polls.forEach(poll => {
            const pollCard = createPollCard(poll);
            pollsContainer.appendChild(pollCard);
        });
    } catch (error) {
        pollsContainer.innerHTML = '<p class="loading">Error loading polls</p>';
        console.error('Error:', error);
    }
}

// Create poll card element
function createPollCard(poll) {
    const card = document.createElement('div');
    card.className = 'poll-card';

    const totalVotes = poll.options.reduce((sum, opt) => sum + opt.votes, 0);

    const optionsHTML = poll.options.map(option => {
        const percentage = totalVotes > 0 ? (option.votes / totalVotes * 100).toFixed(1) : 0;
        return `
            <div class="option-item">
                <div class="option-info">
                    <span class="option-text">${option.text}</span>
                    <span class="vote-count">${option.votes} votes (${percentage}%)</span>
                </div>
                <button class="btn-vote" onclick="vote(${option.id}, ${poll.id})">Vote</button>
                <div class="vote-bar">
                    <div class="vote-bar-fill" style="width: ${percentage}%"></div>
                </div>
            </div>
        `;
    }).join('');

    const date = new Date(poll.created_at).toLocaleString();

    card.innerHTML = `
        <h3 class="poll-question">${poll.question}</h3>
        <p class="poll-date">Created: ${date}</p>
        <div class="poll-options">
            ${optionsHTML}
        </div>
    `;

    return card;
}

// Vote for an option
async function vote(optionId, pollId) {
    try {
        const response = await fetch(`${API_URL}/vote/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                option_id: optionId
            })
        });

        if (response.ok) {
            showToast('Vote recorded!', 'success');
            // Reload polls to show updated results
            setTimeout(() => loadPolls(), 500);
        } else {
            showToast('Failed to record vote', 'error');
        }
    } catch (error) {
        showToast('Error connecting to server', 'error');
        console.error('Error:', error);
    }
}

// Show toast notification
function showToast(message, type = 'success') {
    toast.textContent = message;
    toast.className = `toast ${type} show`;

    setTimeout(() => {
        toast.classList.remove('show');
    }, 3000);
}

// Refresh polls button
refreshPollsBtn.addEventListener('click', loadPolls);

// Auto-refresh polls every 5 seconds
setInterval(loadPolls, 5000);

// Initial load
loadPolls();
