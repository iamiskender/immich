<script lang="ts">
  import AlbumViewer from '$lib/components/album-page/album-viewer.svelte';
  import type { PageData } from './$types';

  export let data: PageData;
</script>

<div class="immich-scrollbar">
  <AlbumViewer album={data.album} />
</div>
