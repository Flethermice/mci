<script lang="ts">
	import { goto } from '$app/navigation';
	import WhiteBtn from '$lib/components/button/WhiteBtn.svelte';
	import Center from '$lib/components/wrapper/Center.svelte';

	let name: string;
	let age: number;
	let gender: Gender;

	let loading: boolean = false;

	function isValid(): boolean {
		return name.length > 0 && age > 0;
	}

	async function onCommit() {
		if (!isValid) {
			alert('Bitte fülle alle Felder aus!');
			return;
		}

		loading = true;

		const res = await fetch('/api/start', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ name, age, gender })
		});
		if (res.status !== 200) {
			alert('Fehler beim Speichern der Daten');
			return;
		}
		loading = false;
		goto('test1');
	}
</script>

<Center>
	<h1 class="mb-6 text-2xl">Demographische Daten</h1>
	<h2 class="mb-4">Bitte gebe deinen vollen Namen ein:</h2>
	<input bind:value={name} class="text-black p-1 rounded-md mb-4" />

	<h2 class="mb-4">Bitte gebe dein Alter ein:</h2>
	<input bind:value={age} class="text-black p-1 rounded-md mb-4" type="number" min="0" max="100" />

	<h2 class="mb-4">Gebe dein Geschlecht an:</h2>
	<select bind:value={gender} class="text-black p-1 rounded-md mb-4">
		<option value="male">Männlich</option>
		<option value="female">Weiblich</option>
		<option value="diverse">Divers</option>
	</select><br />

	<WhiteBtn onClick={onCommit} disabled={loading}>Jetzt starten</WhiteBtn>
</Center>
