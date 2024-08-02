<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
class StorageLinkController extends Controller
{
    public function run()
    {
        $output = Artisan::call('storage:link');
        return '<pre>' . Artisan::output() . '</pre>';
    }
}
