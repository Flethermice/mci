<script lang="ts">
	export let onClick: () => void;
</script>

<button on:click={onClick} class="bg-white text-blue-700 p-3 px-8 rounded-3xl"><slot /></button>
