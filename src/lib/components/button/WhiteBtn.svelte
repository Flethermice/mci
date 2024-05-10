<script lang="ts">
	export let onClick: () => void;
	export let disabled: boolean;
</script>

<button on:click={onClick} {disabled} class="bg-white text-blue-700 p-3 px-8 rounded-3xl"
	><slot /></button
>
