import { CodeBlock } from 'ember-shiki';

const codeExample = `
<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        // $schedule->command('inspire')->hourly();
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}

// From https://github.com/laravel/laravel/blob/10.x/app/Console/Kernel.php
`;

<template>
  <CodeBlock @code={{codeExample}} @language="php" />
</template>
