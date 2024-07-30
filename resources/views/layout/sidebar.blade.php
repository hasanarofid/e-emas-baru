<?php $user = Auth::user(); ?>


<ul class="navigation navigation-main navigation-accordion">
    <li class="navigation-header"><span>Main Menu</span> <i class="icon-menu"></i></li>

    @foreach (App\Models\Menu::orderBy('order', 'asc')->get() as $menuItem)

        @if ($menuItem->id_parent == null)
            @if ($menuItem->url != null)
                @can($menuItem->hak_akses->name)
                    <li class="{{ Request::is($menuItem->url) ? 'active' : null }}"><a
                            href="{{ '/' . $menuItem->url }}"><i class="{{ $menuItem->icon }}"></i>
                            <span>{{ $menuItem->judul }}</span>
                        </a>
                    </li>
                @endcan
            @else
                @can($menuItem->hak_akses->name)
                    @if (strpos($menuItem->judul, 'Cuti') !== false)
                        <li>
                            <a href="#"><i class="{{ $menuItem->icon }}"></i> <span>{{ $menuItem->judul }}
                                </span>
                                @if ($jml_cuti_hrd != 0 && Auth::user()->role->name == 'HRD')
                                    <span class="badge bg-warning-400">{{ $jml_cuti_hrd }}</span>
                                @endif

                            </a>
                            <ul>
                                @foreach ($menuItem->children as $subMenuItem)
                                    @if ($subMenuItem->url == 'hrdPengajuanCuti')
                                        @if (Auth::user()->role->name == 'HRD')
                                            <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}">
                                                <a href="{{ '/' . $subMenuItem->url }}"> <span
                                                        class="badge bg-warning-400">{{ $jml_cuti_hrd }}</span>
                                                    {{ $subMenuItem->judul }}</a>
                                            </li>
                                        @endif
                                    @elseif ($subMenuItem->url != null)
                                        @can($subMenuItem->hak_akses->name)
                                            <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}"><a
                                                    href="{{ '/' . $subMenuItem->url }}">
                                                    {{ $subMenuItem->judul }}
                                                </a>
                                            </li>
                                        @endcan
                                    @else
                                        <li>
                                            <a href="#"><span>{{ $subMenuItem->judul }}</span></a>
                                            <ul>
                                                @foreach ($subMenuItem->children as $thirdMenuItem)
                                                    @if ($thirdMenuItem->url == 'staffPengajuanCuti')
                                                        @if ($jml_bawahan != 0)

                                                            <li
                                                                class="{{ Request::is($thirdMenuItem->url) ? 'active' : null }}">
                                                                <a href="{{ '/' . $thirdMenuItem->url }}"> <span
                                                                        class="badge bg-warning-400">{{ $jml_pengajuan_cuti_bawahan }}</span>
                                                                    {{ $thirdMenuItem->judul }}</a>
                                                            </li>
                                                        @endif
                                                    @else
                                                        <li
                                                            class="{{ Request::is($thirdMenuItem->url) ? 'active' : null }}">
                                                            <a href="{{ '/' . $thirdMenuItem->url }}">
                                                                {{ $thirdMenuItem->judul }}
                                                            </a>
                                                        </li>
                                                    @endif
                                                @endforeach
                                            </ul>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>

                        </li>

                    @elseif (strpos($menuItem->judul, 'Staff') !== false)
                        <li>
                            <a href="#"><i class="{{ $menuItem->icon }}"></i> <span>{{ $menuItem->judul }}
                                </span>
                                @if ($jml_pengajuan_cuti_bawahan != 0)
                                    <span class="badge bg-warning-400">{{ $jml_pengajuan_cuti_bawahan }}</span>
                                @endif

                            </a>
                            <ul>
                                @foreach ($menuItem->children as $subMenuItem)

                                    @if ($subMenuItem->url == 'staffPengajuanCuti')
                                        @if ($jml_bawahan != 0)

                                            <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}">
                                                <a href="{{ '/' . $subMenuItem->url }}"> <span
                                                        class="badge bg-warning-400">{{ $jml_pengajuan_cuti_bawahan }}</span>
                                                    {{ $subMenuItem->judul }}</a>
                                            </li>
                                        @endif
                                    @elseif ($subMenuItem->url == 'hrdPengajuanCuti' && Auth::user()->role == 'HRD')
                                        <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}">
                                            <a href="{{ '/' . $subMenuItem->url }}"> <span
                                                    class="badge bg-warning-400">{{ $jml_cuti_hrd }}</span>
                                                {{ $subMenuItem->judul }}</a>
                                        </li>

                                    @elseif ($subMenuItem->url != null)
                                        <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}"><a
                                                href="{{ '/' . $subMenuItem->url }}">
                                                {{ $subMenuItem->judul }}
                                            </a>
                                        </li>

                                    @else
                                        <li>
                                            <a href="#"><span>{{ $subMenuItem->judul }}</span></a>
                                            <ul>
                                                @foreach ($subMenuItem->children as $thirdMenuItem)
                                                    @if ($thirdMenuItem->url == 'staffPengajuanCuti')
                                                        @if ($jml_bawahan != 0)

                                                            <li
                                                                class="{{ Request::is($thirdMenuItem->url) ? 'active' : null }}">
                                                                <a href="{{ '/' . $thirdMenuItem->url }}"> <span
                                                                        class="badge bg-warning-400">{{ $jml_pengajuan_cuti_bawahan }}</span>
                                                                    {{ $thirdMenuItem->judul }}</a>
                                                            </li>
                                                        @endif
                                                    @else
                                                        <li
                                                            class="{{ Request::is($thirdMenuItem->url) ? 'active' : null }}">
                                                            <a href="{{ '/' . $thirdMenuItem->url }}">
                                                                {{ $thirdMenuItem->judul }}
                                                            </a>
                                                        </li>
                                                    @endif
                                                @endforeach
                                            </ul>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>

                        </li>

                    @else
                        <li>
                            <a href="#"><i class="{{ $menuItem->icon }}"></i> <span>{{ $menuItem->judul }}</span></a>
                            <ul>
                                @foreach ($menuItem->children as $subMenuItem)

                                    @if ($subMenuItem->url == 'staffPengajuanCuti')
                                        @if ($jml_bawahan != 0)

                                            <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}">
                                                <a href="{{ '/' . $subMenuItem->url }}"> <span
                                                        class="badge bg-warning-400">{{ $jml_pengajuan_cuti_bawahan }}</span>
                                                    {{ $subMenuItem->judul }}</a>
                                            </li>
                                        @endif
                                    @elseif ($subMenuItem->url == 'hrdPengajuanCuti')
                                        <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}">
                                            <a href="{{ '/' . $subMenuItem->url }}"> <span
                                                    class="badge bg-warning-400">{{ $jml_cuti_hrd }}</span>
                                                {{ $subMenuItem->judul }}</a>
                                        </li>

                                    @elseif ($subMenuItem->url != null)
                                        <li class="{{ Request::is($subMenuItem->url) ? 'active' : null }}"><a
                                                href="{{ '/' . $subMenuItem->url }}">
                                                {{ $subMenuItem->judul }}
                                            </a>
                                        </li>

                                    @else
                                        <li>
                                            <a href="#"><span>{{ $subMenuItem->judul }}</span></a>
                                            <ul>
                                                @foreach ($subMenuItem->children as $thirdMenuItem)
                                                    @if ($thirdMenuItem->url == 'staffPengajuanCuti')
                                                        @if ($jml_bawahan != 0)

                                                            <li
                                                                class="{{ Request::is($thirdMenuItem->url) ? 'active' : null }}">
                                                                <a href="{{ '/' . $thirdMenuItem->url }}"> <span
                                                                        class="badge bg-warning-400">{{ $jml_pengajuan_cuti_bawahan }}</span>
                                                                    {{ $thirdMenuItem->judul }}</a>
                                                            </li>
                                                        @endif
                                                    @else
                                                        <li
                                                            class="{{ Request::is($thirdMenuItem->url) ? 'active' : null }}">
                                                            <a href="{{ '/' . $thirdMenuItem->url }}">
                                                                {{ $thirdMenuItem->judul }}
                                                            </a>
                                                        </li>
                                                    @endif
                                                @endforeach
                                            </ul>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </li>
                    @endif
                @endcan
            @endif
        @endif

    @endforeach


</ul>
