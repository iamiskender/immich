<script lang="ts">
  import CircleIconButton from '$lib/components/elements/buttons/circle-icon-button.svelte';
  import { downloadArchive, downloadFile } from '$lib/utils/asset-utils';
  import CloudDownloadOutline from 'svelte-material-icons/CloudDownloadOutline.svelte';
  import MenuOption from '../../shared-components/context-menu/menu-option.svelte';
  import { getAssetControlContext } from '../asset-select-control-bar.svelte';

  export let filename = 'immich.zip';
  export let sharedLinkKey: string | undefined = undefined;
  export let menuItem = false;

  const { getAssets, clearSelect } = getAssetControlContext();

  const handleDownloadFiles = async () => {
    const assets = Array.from(getAssets());
    if (assets.length === 1) {
      await downloadFile(assets[0], sharedLinkKey);
      clearSelect();
      return;
    }

    await downloadArchive(filename, { assetIds: assets.map((asset) => asset.id) }, clearSelect, sharedLinkKey);
  };
</script>

{#if menuItem}
  <MenuOption text="Download" on:click={handleDownloadFiles} />
{:else}
  <CircleIconButton title="Download" logo={CloudDownloadOutline} on:click={handleDownloadFiles} />
{/if}
