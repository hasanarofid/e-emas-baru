<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = [
            'dashboard-admin',
            'dashboard-hrd',
            'menu-staff',
            'manajemen-role',
            'menu-kebijakan-kantor',
            'menu-pegawai',
            'menu-export-kinerja',
            'menu-jabatan',
            'menu-divisi',
            'menu-presensi',
            'menu-cuti',
            'menu-gaji',
            'menu-surat-peringatan',
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }
    }
}
