<script lang="ts">
	import WhiteLink from '$lib/button/WhiteLink.svelte';
	import Center from '$lib/wrapper/Center.svelte';
</script>

<Center>
	<h1 class="font-bold text-2xl mb-4">MCI - Nutzerstudie</h1>
	<p class="font-bold mb-4">Hallo! Vielen Dank das du an unserer Studie teilnimmst.</p>
	<p class="underline">Ablauf:</p>
	<ol class="list-decimal list-inside mb-8">
		<li>Teile uns kurz mit wer du bist: (Name, Alter, Geschlecht)</li>
		<li>Du musst insgesammt 3 Testsdurchführen (jeder Test dauert ca. 2-3 Minuten)</li>
		<li>Die Ergebnisse werden automatisch an uns übermittelt, du musst nichts weiteres tun :)</li>
	</ol>

	<WhiteLink href="start" />
</Center>
