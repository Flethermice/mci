<script lang="ts">
	import { onMount } from 'svelte';

	let experimentActive = false;
	let stimulusIsVisible = false;

	let element: HTMLElement;
	let description: HTMLElement;

	let counter = 0;
	let startTime: Date;

	onMount(() => {
		element = document.getElementById('content')!;
		description = document.getElementById('description')!;
	});

	function wait(ms: number) {
		return new Promise((resolve) => setTimeout(resolve, ms));
	}

	function longWait() {
		const duration = Math.random() * 4000;
		+2000;
		wait(duration);
	}

	function displayElement() {
		const xPos = Math.random() * 100;
		const yPos = Math.random() * 100;

		const div = document.createElement('div');
		div.style.position = 'absolute';
		div.style.left = `${xPos}%`;
		div.style.top = `${yPos}%`;
		div.style.width = '100px';
		div.style.height = '100px';
		div.style.backgroundColor = 'red';

		element.appendChild(div);
	}

	function run() {
		longWait();
		startTime = new Date();
		displayElement();
	}

	function startExperiment() {
		experimentActive = true;
		while (counter < 30) {
			run();
			counter++;
		}
	}

	function recordStimulusReactionTime() {}

	window.addEventListener('keydown', (event) => {
		if (event.key === ' ') {
			if (!experimentActive) {
				startExperiment();
				return;
			}

			if (stimulusIsVisible) {
				recordStimulusReactionTime();
			}
		} else if (event.key === 'a') {
		} else if (event.key === 'b') {
		}
	});
</script>

<div class="flex flex-col">
	<div>
		Test 1
		<div id="description">Drücker Leertaste um das Experiment zu beginnen</div>
	</div>
	<div id="content"></div>
</div>
